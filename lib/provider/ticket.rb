module TicketMaster::Provider
  module Lighthouse
    # Ticket class for ticketmaster-lighthouse
    #
    # Due to the way Lighthouse stores tickets, we actually end up creating a new ticket version
    # every time we edit tickets. Their api FAQ states these attributes as the only editable ones(?):
    #
    # * title
    # * body - follows the same formatting rules.
    # * state - Can be any one of these: new, open, resolved, hold, invalid. Optional, set to open by default for new tickets.
    # * assigned-user-id - optional
    # * milestone-id - optional
    # * tag - space or comma delimited list of tags
    #
    # We had to remap things a bit since lighthouse doesn't name things as ticketmaster specifies.
    #
    # * id => number (read-only)
    # * status => state
    # * resolution => ticket.latest_body
    # * description => ticket.original_body (setting a new description creates a new body)
    # * assignee => assigned_user_name (read-only)
    # * requestor => creator_name (read-only)
    # * project_id => prefix_options[:project_id]
    # * priority
    # * title 
    # * created_at
    # * updated_at
    
    class Ticket < TicketMaster::Provider::Base::Ticket
      @@allowed_states = ['new', 'open', 'resolved', 'hold', 'invalid']
      attr_accessor :prefix_options
      API = LighthouseAPI::Ticket
      
      # This is to get the ticket id
      # We can't set ids, so there's no 'id=' method.
      def id
        @system_data[:client].number
      end
      
      # This is to get the status, mapped to state
      def status
        state
      end
      
      # This is to set the status, mapped to state
      def status=(stat)
        stat = state unless @@allowed_states.include?(stat)
        state = stat
      end
      
      # Get the resolution, mapped to latest_body
      def resolution
        latest_body
      end
      
      # Set the resolution...also sets state to resolved
      def resolution=(res)
        state = 'resolved'
        body = res
      end
      
      # Get the description, mapped to original_body
      def description
        original_body
      end
      
      # Set the description, mapped to body, which actually does a comment
      def description=(desc)
        self.body = desc
      end
      
      # Get the assigned person's name
      def assignee
        assigned_user_name
      end
      
      # Get the requestor's name
      def requestor
        creator_name
      end
      
      # Get the project id
      def project_id
        prefix_options[:project_id]
      end
      
      # Set the body
      def body=(bod)
        @system_data[:client].body = nil
        super(bod)
      end
      
      # Tags, a little helper for the ticket tagging
      def tags
        return @tags if @tags
        tagz = self.tag.split(/([\w\d]+)|"([\w \d]+)"/)
        tagz.delete(' ')
        tagz.delete('')
        @tags = tagz
      end
      
      # Gotta unset the body attribute...otherwise every save ends up using that body
      def save
        tag = @tags.reduce([]) do |mem, t|
          t = "\"#{t}\"" if t.include?(' ')
          mem << t
        end.join(' ') if @tags
        result = super
        body = nil
        @system_data[:client].body = nil
        result
      end
      
      # The closer
      def close(resolution = 'resolved')
        resolution = 'resolved' unless @@allowed_states.include?(resolution)
        ticket = LighthouseAPI::Ticket.find(self.id, :params => {:project_id => self.prefix_options[:project_id]})
        ticket.state = resolution
        ticket.save
      end
    end
  end
end
