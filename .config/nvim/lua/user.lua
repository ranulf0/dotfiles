USER = {
  indent_marker = function(indent_size)
    local char = "│"
    local spaces = string.rep(" ", indent_size - 1)
    return char .. spaces
  end
}
