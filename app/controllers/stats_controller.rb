class StatsController < ApplicationController
    before_action :set_stat, only: [:show, :edit, :update, :destroy]
  
    # GET /stats
    # GET /stats.json
    def index
      @stat = Stat.all
    end
  
    # GET /stats/1
    # GET /stats/1.json
    def show
    end
  
    # GET /stats/new
    def new
      @stat = Stat.new
    end
  
    # GET /stats/1/edit
    def edit
    end
  
    # POST /stats
    def create
      @stat = Stat.new(stat_params)
  
        if @stat.save
        redirect_to @stat, notice: "La stat a bien été créée ! " 
        else
          render :new  
        end
    end
  
    # PATCH/PUT /stats/1
    # PATCH/PUT /stats/1.json
    def update
        if @stat.update(stat_params)
        redirect_to @stat, notice: "La stat a bien été modifié ! " 
        else
        render :edit 
      end
    end
  
    # DELETE /stats/1
    # DELETE /stats/1.json
    def destroy
      @stat.destroy
        redirect_to stats_url, notice: "La stat à bien été supprimé ! "
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_stat
        @stat = Stat.find_by(idUser: current_user.id)
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def stat_params
        params.require(:stat).permit(:name, :artist, :password, :bestScore, :lastScore)
      end
  