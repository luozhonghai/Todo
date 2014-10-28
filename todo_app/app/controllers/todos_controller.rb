class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  # GET /todos
  def index
    #@todos =Todo.order(:due).page(params[:page]).per(3)

    if params[:user_id]
      #@todos = Todo.where(user_id: params[:user_id]).order(:due).page(params[:page]).per(3)
      @todos = Todo.list_by_user(params[:user_id].page(params[:page]))
    else
      #@todos =Todo.order(:due).page(params[:page]).per(3)
      @todos = Todo.list_all.page(params[:page])
    end
    #logger.debug @todo.inspect
  end

  # GET /todos/1
  def show
    if request.xml_http_request?
      render partial: 'show_body'
    end
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
    if request.xml_http_request?
      render partial: 'form'
    end
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo, notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      if request.xhr?
        render :json =>{id: @todo.id, due: @todo.due, task: @todo.task, user_name: @todo.user.name}
      else
        redirect_to @todo, notice: 'Todo was successfully updated.'
      end
    else
      if request.xhr?
        errors = Hash.new(0)
        errors_count = 0;
        @todo.errors.full_messages.each do |message|
          errors_count += 1
          errors["errors_"+errors_count.to_s] = message
        end
        render :json => errors
      else
        render :edit
      end
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:due, :task, :memo, :user_id)
    end

    def require_login
      if session[:login] == nil
        redirect_to new_login_path
      end
    end
end
