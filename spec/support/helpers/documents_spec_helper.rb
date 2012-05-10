module DocumentsSpecHelper
  def stub_message_maker
    MessageMaker.stub(:make_message)
  end
end
