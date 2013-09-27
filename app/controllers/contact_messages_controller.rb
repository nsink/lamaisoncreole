class ContactMessagesController < ApplicationController
  before_filter :authenticate, :except => [:new, :create, :show]

  # GET /contact_messages
  # GET /contact_messages.json
  def index
    @contact_messages = ContactMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contact_messages }
    end
  end

  # GET /contact_messages/1
  # GET /contact_messages/1.json
  def show
    if ContactMessage.last && ContactMessage.last.id == params[:id]
      @contact_message = ContactMessage.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @contact_message }
      end
    else
      redirect_to contact_messages_path
    end
  end

  # GET /contact_messages/new
  # GET /contact_messages/new.json
  def new
    @contact_message = ContactMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact_message }
    end
  end

  # GET /contact_messages/1/edit
  def edit
    @contact_message = ContactMessage.find(params[:id])
  end

  # POST /contact_messages
  # POST /contact_messages.json
  def create
    if ContactMessage.where('created_at > ?', 10.minutes.ago).size > 10
      redirect_to contact_messages_path, notice: "trop d'emails envoyes"
    else
      @contact_message = ContactMessage.new(params[:contact_message])

      respond_to do |format|
        if @contact_message.save
          begin
            UserMailer.contact_email(@contact_message).deliver
          rescue Exception => e
            UserMailer.safe_contact_email(@contact_message).deliver
          end
          format.html { redirect_to @contact_message, notice: 'Merci !' }
          format.json { render json: @contact_message, status: :created, location: @contact_message }
        else
          format.html { render action: "new" }
          format.json { render json: @contact_message.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /contact_messages/1
  # PUT /contact_messages/1.json
  def update
    @contact_message = ContactMessage.find(params[:id])

    respond_to do |format|
      if @contact_message.update_attributes(params[:contact_message])
        format.html { redirect_to @contact_message, notice: 'Contact message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_messages/1
  # DELETE /contact_messages/1.json
  def destroy
    @contact_message = ContactMessage.find(params[:id])
    @contact_message.destroy

    respond_to do |format|
      format.html { redirect_to contact_messages_url }
      format.json { head :no_content }
    end
  end
end
