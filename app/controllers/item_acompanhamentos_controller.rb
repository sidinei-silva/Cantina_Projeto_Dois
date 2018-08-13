class ItemAcompanhamentosController < ApplicationController
  before_action :set_item_acompanhamento, only: [:show, :edit, :update, :destroy]

  # GET /item_acompanhamentos
  # GET /item_acompanhamentos.json
  def index
    @item_acompanhamentos = ItemAcompanhamento.all
  end

  # GET /item_acompanhamentos/1
  # GET /item_acompanhamentos/1.json
  def show
  end

  # GET /item_acompanhamentos/new
  def new
    @item_acompanhamento = ItemAcompanhamento.new
  end

  # GET /item_acompanhamentos/1/edit
  def edit
  end

  # POST /item_acompanhamentos
  # POST /item_acompanhamentos.json
  def create
    @item_acompanhamento = ItemAcompanhamento.new(item_acompanhamento_params)

    respond_to do |format|
      if @item_acompanhamento.save
        format.html { redirect_to @item_acompanhamento, notice: 'Item acompanhamento was successfully created.' }
        format.json { render :show, status: :created, location: @item_acompanhamento }
      else
        format.html { render :new }
        format.json { render json: @item_acompanhamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_acompanhamentos/1
  # PATCH/PUT /item_acompanhamentos/1.json
  def update
    respond_to do |format|
      if @item_acompanhamento.update(item_acompanhamento_params)
        format.html { redirect_to @item_acompanhamento, notice: 'Item acompanhamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_acompanhamento }
      else
        format.html { render :edit }
        format.json { render json: @item_acompanhamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_acompanhamentos/1
  # DELETE /item_acompanhamentos/1.json
  def destroy
    @item_acompanhamento.destroy
    respond_to do |format|
      format.html { redirect_to item_acompanhamentos_url, notice: 'Item acompanhamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item_acompanhamento
    @item_acompanhamento = ItemAcompanhamento.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_acompanhamento_params
    params.require(:item_acompanhamento).permit(:valor_acompanhamento, :acompanhamento_id, :item_pedido_id)
  end
end
