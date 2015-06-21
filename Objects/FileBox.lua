Inherit = "TextBox"
Invalid = false
InitialTextColour = nil
DirsAllowed = false

OnUpdate = function(self, value)
  if value == "Text" then
    local exists = fs.exists(self.Text)
    local isDir = fs.isDir(self.Text)
    local valid = false

    if not (exists and not (not self.DirsAllowed and isDir)) then
      self.TextColour = colours.red
      self.Invalid = true
    else
      self.TextColour = colours.black
      self.Invalid = false
    end
  end
end

OnLoad = function(self)
  if not self.CursorPos then
		self.CursorPos = #(self.Text or "")
	end

  self.InitialTextColour = self.TextColour
end
