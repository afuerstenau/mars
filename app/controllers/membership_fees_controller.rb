class MembershipFeesController < ApplicationController
  # GET /membership_fees
  # GET /membership_fees.json
  def index
    @membership_fees = MembershipFee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @membership_fees }
    end
  end

  # GET /membership_fees/1
  # GET /membership_fees/1.json
  def show
    @membership_fee = MembershipFee.find(params[:id])
    @member = Member.find(@membership_fee.member_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @membership_fee }
    end
  end

  # GET /membership_fees/new
  # GET /membership_fees/new.json
  def new
    @membership_fee = MembershipFee.new
    @membership_fee.member_id=(params[:member_id])
    @member = Member.find(@membership_fee.member_id)
    @membership_fee.payment_method=@member.payment_method
    @membership_fee.fee=@member.beitrag
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @membership_fee }
    end
  end

  # GET /membership_fees/1/edit
  def edit
    @membership_fee = MembershipFee.find(params[:id])
    @member = Member.find(@membership_fee.member_id)
  end

  # POST /membership_fees
  # POST /membership_fees.json
  def create
    @membership_fee = MembershipFee.new(params[:membership_fee])

    respond_to do |format|
      if @membership_fee.save
        format.html { redirect_to @membership_fee, notice: 'Membership fee was successfully created.' }
        format.json { render json: @membership_fee, status: :created, location: @membership_fee }
      else
        format.html { render action: "new" }
        format.json { render json: @membership_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /membership_fees/1
  # PUT /membership_fees/1.json
  def update
    @membership_fee = MembershipFee.find(params[:id])

    respond_to do |format|
      if @membership_fee.update_attributes(params[:membership_fee])
        format.html { redirect_to @membership_fee, notice: 'Membership fee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @membership_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membership_fees/1
  # DELETE /membership_fees/1.json
  def destroy
    @membership_fee = MembershipFee.find(params[:id])
    @membership_fee.destroy

    respond_to do |format|
      format.html { redirect_to membership_fees_url }
      format.json { head :no_content }
    end
  end
end
