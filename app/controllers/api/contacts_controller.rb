class Api::ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = Contact.all
  end

  def show; end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      ContactMailer.thanks_for_contacting(@contact).deliver
      render json: {
               contact: @contact,
               message: 'お問い合わせ内容送信しました！',
             },
             status: :created
    else
      render json: {
               message: 'お問い合わせの送信に失敗しました！',
             },
             status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html do
          redirect_to @contact, notice: 'Contact was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json do
          render json: @contact.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html do
        redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
