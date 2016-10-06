# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ticket.destroy_all
Field.destroy_all
Form.destroy_all
FieldDatum.destroy_all

[
{name: 'Customer Name', input_type: :text, default_value: 'Acme Inc.' },
{name: 'Shippable?', input_type: :check_box, default_value: 'true' },
{name: 'Description?', input_type: :text_area, default_value: 'I never looked so good!'}
].each { |h| Field.create(h) }

form = Form.create(fields: Field.all)

10.times do |i|
  Commands::CreateTicket.new(ticket_params: {title: "#{i}-test"}, form_params: {id: form.id}).call
end
