BackgroundColour = colours.white
ActiveBackgroundColour = colours.green
TextColour = colours.black
Text = "<Unnamed>"
Friends = {}
AutoWidth = true
Selected = false
Enabled = true

OnUpdate = function(self, value)
  if value == "Text" and self.AutoWidth then
    self.Width = #self.Text + 2
  end

  if value == "Selected" and self.Selected then
    for _,v in pairs(self.Friends) do
      v.Selected = false
    end
  end
end

OnLoad = function(self)
  if self.AutoWidth then
    self.Width = #self.Text + 2
  end

  self.Height = 1
end

OnDraw = function(self, x, y)
  Drawing.DrawCharacters(x, y, self.Selected and "#" or "o", self.Selected and colours.green or colours.lightGrey, colours.white)
  Drawing.DrawCharacters(x + 2, y, self.Text, self.TextColour, colours.transparent)
end

Click = function(self, event, side, x, y)
  if self.Visible and not self.IgnoreClick and self.Enabled and event ~= "mouse_scroll" then
    self.Selected = true

    if self.OnSelectionChange then
      self:OnSelectionChange()
    end

    return true
  end
end
