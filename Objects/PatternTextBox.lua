Inherit = "TextBox"
Pattern = ".+"
Invalid = false
InitialTextColour = nil

OnUpdate = function(self, value)
  if value == "Text" then
    if self.Text:match(self.Pattern) == nil then
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
