class Postoffice < ActionMailer::Base
  # located in models/postoffice.rb
  # make note of the headers, content type, and time sent
  # these help prevent your email from being flagged as spam
=begin
  case ENV['RAILS_ENV']
    when "development"
      default_url_options[:host] = "localhost:3000"
    else
      default_url_options[:host] = "http://lets01.ebotech.com"
  end
  
  def sendreport(username, email, report)
    recipients    email
    from          "lets@gmail"
    headers       "Reply-to" => "#{email}"
    subject       "Your Report Attached"
    sent_on       Time.now
    content_type  "multipart/mixed"
    
#    body[:name]  = username
#    body[:reportname]= report.r_script.name
#    body[:updateon]= report.nextupdate    
#    
#    attachment :content_type => "application/x-pdf",
#      :body => File.read(report.genreport.path),
#      :filename => "#{report.r_script.name}.pdf"
#
#    part :content_type => "text/html",
#      :body => render_message("sendreport", body)

#    attachment "application/x-pdf" do |a|  
#      a.body = File.read(report.genreport.path)
#      a.filename = "#{report.r_script.name}.pdf"  
#    end unless report.genreport.blank?

    part :content_type => "multipart/alternative" do |a|
#      a.part "text/plain" do |p|
#        p.body = render_message 'order_placed.text.plain.erb', :purchase => purchase
#      end

      a.part "text/html" do |p|
        p.body = render_message 'sendreport', :name => username, :reportname => report.r_script.name, :updateon => report.nextupdate
      end
    end
    
    attachment :content_type => "application/pdf", :body => File.new("public/system/reportwork/req#{report.id}/output.pdf").read, :filename => "#{report.r_script.name}.pdf"

  end


  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "RAuto@infonomics.ltd.uk"
    headers       "Reply-to" => "rauto@infonomics.ltd.uk"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token), :username => user.username
    content_type  "text/html"
#    part :content_type => "text/html",
#      :body => render_message("password_reset_instructions", body)
  end

  def error_message(exception, trace, session, params, env)
    subject       "Error message: #{env['REQUEST_URI']}"
    from         'RAuto@infonomics.ltd.uk'
    recipients    'robin@infonomics.ltd.uk'
    sent_on       Time.now
    content_type  "text/html"
    body          :exception => exception, :trace => trace, :session => session, :params => params, :env => env
  end

  def warn_of_delay(job)
    subject       "Warning: RAuto Delayed job"
    from          "RAuto@infonomics.ltd.uk"
    recipients    "robin@infonomics.ltd.uk"
    sent_on       Time.now
    context_type  "text/html"
    body          :job => job
  end
=end

end
