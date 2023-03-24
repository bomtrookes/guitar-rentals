# create.json.jbuilder
puts "DEBUG: Rendering create.json.jbuilder"
json.message @message.content

if @message.persisted?
  json.my_form render(partial: 'messages/form.html.erb', formats: :html, locals: { chatroom: @chatroom, message: Message.new })
  json.my_message render(partial: 'messages/message.html.erb', formats: :html, locals: { message: @message })
else
  json.my_form render(partial: 'messages/form.html.erb', formats: :html, locals: { chatroom: @chatroom, message: @message })
end
