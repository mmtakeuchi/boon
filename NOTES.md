<%= f.collection_check_boxes :category_ids, Category.all, :id, :name do |b| %>
        <label>
            <% if @category.id == category.id %>
                <%= b.check_box(checked: true) %>
            <% else %>
                <%= b.check_box %>
            <% end %>

            <span><%= b.label %></span><br></span>
        </label>
    <% end %>


    <div>
        <%= hidden_field_tag "stock[category_ids][]", nil %>
            <% Category.all.each do |category| %>
            <label>
                <%= check_box_tag "stock[category_ids][]", category.id, @stock.categories.include?(category)%>
                <span><%= label_tag :category_id, category.name %></span><br>
            </label>
        <% end %>
    </div>