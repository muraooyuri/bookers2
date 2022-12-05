class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    book_comments = current_user.book_comments.new(book_comment_params)
    book_comments.book_id = book.id
    book_comments.save
    redirect_to request.referer
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def book_comment_params
     params.require(:book_comment).permit(:comment)
  end
end
