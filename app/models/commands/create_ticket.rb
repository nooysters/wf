class Commands::CreateTicket

  def initialize(ticket_params: {}, form_params: {})
    @ticket_params = ticket_params
    @form_params = form_params
  end

  def call()
    @ticket = Ticket.new( @ticket_params )
    @form = Form.find_or_create!(form_params)

    @ticket.form = @form

    if( @ticket.save! )
      initialize_data
    end

    @ticket
  end

  private

  def initialize_data(fields)
    @form.fields.each do |field|
      Field.datum.create do |f|
         f.field_id: field.id,
         f.fieldable: @ticket
        # f.value: field.default_value
      end
    end
  end

end
