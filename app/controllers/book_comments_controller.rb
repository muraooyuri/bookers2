class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    book_comments = current_user.book_comments.new(book_comment_params)
    book_comments.book_id = book.id
    book_comments.save
    @books=Book.find(params[:book_id])
    @book_comment = BookComment.new
  end

  def destroy
    @book_comment=BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @book_comment.destroy
    @book_comment = BookComment.new
  end

  private

  def book_comment_params
     params.require(:book_comment).permit(:comment)
  end
end
