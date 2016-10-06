class Commands::CreateTicket

  def initialize(ticket_params: {}, form_params: {})
    @ticket_params = ticket_params
    @form_params = form_params
  end

  def call()
    @ticket = Ticket.new( @ticket_params )
    @form = Form.find_or_create_by(@form_params)

    @ticket.form = @form

    if( @ticket.save! )
      initialize_data
    end

    @ticket
  end

  private

  def initialize_data()
    @form.fields.each do |field|
      FieldDatum.create do |f|
         f.field = field
         f.fieldable_id = @ticket.id
         f.fieldable_type = @ticket.class.name
        # f.value: field.default_value
      end
    end
  end

end
