require 'csv'

module Api
    module v1
        class NetflixesController < ApplicationController

            # GET /netflixes
            def index
                @netflixes = Netflix.all

                render json: @netflixes
            end
            
            # GET /netflixes/1
            def show
                @netflix = Netflix.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded Netflix Title', data:@netflix}, status: :ok  
            end

            # POST /netflixes
            def create
              @netflix = Netflix.new(netflix_params)
              
              if @netflix.save
                render json: {status: 'SUCCESS', message: 'Saved Netflix', data:@netflix}, stauts: :ok
              else
                render json: {status: 'ERROR', message: 'Netflix not saved', data:@netflix.errors}, status: :unprocessable_entity
              end
            end

            # PATCH/PUT /netflixes/1
            def update
                if @netflix.update(netflix_params)
                    render json: {status: 'SUCCESS', message: 'Updated Netflix', data:@netflix}, stauts: :ok
                else
                    render json: {status: 'ERROR', message: 'Netflix not updated', data:@netflix.errors}, status: :unprocessable_entity
            end

            # DELETE /titles/1
            def destroy
                @netflix = Netflix.find(params[:id])
                @netflix.destroy
                render json: {status: 'SUCCESS', message: 'Deleted Netflix', data:@netflix}, stauts: :ok
            end

            # FALTA O IMPORTAR CSV




            private
            def netflix_params
                params.require(:netflix).permit(:id_csv, :genre, :title, :director, :cast, :country,
                                                :published_at, :year, :rating, :duration, :listed_in, :description)
            end

        
            
        end
    end
end
