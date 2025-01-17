# RackSessionFix "ActionDispatch::Request::Session::DisabledSessionError"
# This is an unfixed bug in Devise with Rails 7 at the moment.
# This workaround gives devise a fake rack session hash that has 'enabled?' set to false to avoid the error that it would otherwise raise.
# Include this module in registrations_controller and sessions_controller.
module RackSessionFix
  extend ActiveSupport::Concern
  class FakeRackSession < Hash
    def enabled?
      false
    end
  end
  included do
    before_action :set_fake_rack_session_for_devise
    private
    def set_fake_rack_session_for_devise
      request.env["rack.session"] ||= FakeRackSession.new
    end
  end
end
