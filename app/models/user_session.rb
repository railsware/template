class UserSession < Authlogic::Session::Base
  consecutive_failed_logins_limit(Settings.consecutive_failed_logins_limit)
end