module AuthorsHelper
  def author_params
    params.require(:author).permit(:name, :email)
  end
end