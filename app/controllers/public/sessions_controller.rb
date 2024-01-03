# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

  def customer_state
    #フォームで入力されたEmailがCustomerテーブルに格納されているEmailカラムの中に存在するかをチェック。存在したらそのEmailを取得。存在しなかったら取得しない。
    #email:これは比較するカラムを記述。比較するレコードをparams[:モデル名][:カラム名]で取得。
    customer = Customer.find_by(email: params[:customer][:email])
    #customerが空だった場合、returnで処理を終了する。
    return if customer.nil?
    #取得したEmail(customer)とペアのパスワードがcustomerテーブルにあるかチェックしている。そしてparacms[:モデル名][:カラム名]でフォームで入力されたパスワードを取得。
    return unless customer.valid_password?(params[:customer][:password])
    if customer.is_deleted == true
      redirect_to new_customer_registration_path
    end
  end
end
