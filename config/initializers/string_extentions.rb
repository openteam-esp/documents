# encoding: utf-8

class String
  def uncapitalize
    self[0, 1].mb_chars.downcase + self[1..-1]
  end
end
