defmodule BeddiafulWeb.Layouts do
  use BeddiafulWeb, :html

  embed_templates "layouts/*"

  def meta_tags(assigns) do
    ~H"""
    <%= for tag <- BeddiafulWeb.ResumeData.meta_tags() do %>
      <%= if tag.attribute == "name" do %>
        <meta name={tag.name} content={tag.content}>
      <% else %>
        <meta property={tag.name} content={tag.content}>
      <% end %>
    <% end %>
    """
  end
end