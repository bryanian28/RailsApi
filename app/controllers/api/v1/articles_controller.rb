module Api
    module V1
      class ArticlesController < ApplicationController
        before_action :set_headers

        def index
            articles = Article.order('created_at DESC');
            render json: {status: 'SUCCESS', message:'Loaded articles', data:articles},status: :ok
            end

            def show
                articles = Article.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded articles', data:articles},status: :ok
                end
            def create
                articles = Article.new(article_params)

                if articles.save
                    render json: {status: 'SUCCESS', message:'Loaded articles', data:articles},status: :ok
                else
                    render json: {status: 'ERROR', message:'Article not saved', data:articles.errors},status: :unprocessable_entity
                end
            end

            def destroy

                article = Article.find(params[:id])
                article.destroy
                render json: {status: 'SUCCESS', message:'Deleted article', data:article},status: :ok
              end

              def update
                article = Article.find(params[:id])
                if article.update_attributes(article_params)
                  render json: {status: 'SUCCESS', message:'Updated article', data:article},status: :ok
                else
                  render json: {status: 'ERROR', message:'Article not updated', data:article.errors},status: :unprocessable_entity
                end
              end
        # THIS
        def set_headers
            headers['Access-Control-Allow-Origin'] = '*'
            headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
            headers['Access-Control-Request-Method'] = '*'
            headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
          end
            private

            def article_params
              params.permit(:title, :description)
            end
          end
        end
      end
