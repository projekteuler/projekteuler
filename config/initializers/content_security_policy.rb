# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

Rails.application.config.content_security_policy do |policy|
  policy.default_src :none
  policy.font_src    :self, 'https://cdnjs.cloudflare.com'
  policy.img_src     :self, 'https://cdnjs.cloudflare.com', 'https://projecteuler.net', 'https://matomo.pfischbeck.de'
  policy.object_src  :none
  policy.script_src  :self, 'https://cdnjs.cloudflare.com', 'https://matomo.pfischbeck.de'
  policy.style_src   :self, :unsafe_inline
  policy.connect_src :self
  policy.frame_src 'https://matomo.pfischbeck.de'

  # Specify URI for violation reports
  # policy.report_uri "/csp-violation-report-endpoint"
end

# If you are using UJS then enable automatic nonce generation
# Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }

# Set the nonce only to specific directives
# Rails.application.config.content_security_policy_nonce_directives = %w(script-src)

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
