# middleman-medium
Fetches posts previews from a Medium Feed on every build.

If what you need is to build a preview of you latest medium posts on your site this is the right middleman extension for you. It's still meant to generate static pages, so remember to rebuild/redeploy your production site when you add new medium posts (or just schedule a re-deploy on a daily/weekly/etc basis).

Just add it to your `config.rb` file like any other middleman extension.

```ruby
activate :middleman_medium, source: 'https://blog.continuum.cl/feed'
```

The source option must be the feed of your medium account, which normaly is
`https://medium.com/feed/YOUR-ACCOUNT`

The method `fetch_medium_posts` is exposed to the templates and return an array
of Hashes with the following structure:

```ruby
[
  {
    title: "La verdadera experiencia de usuario",
    date: 2018-05-23 17:18:33 +0000,
    url: "https://blog.continuum.cl/la-verdadera-experiencia-de-usuario-4683f3f1236a? source=rss----d66605ce046d---4",
    category: "continuous-delivery",
    img: "https://cdn-images-1.medium.com/max/1024/1*CEEf5FiezbTxPLOmt4hntg.jpeg"
  },
  {
    title:"Las 7 razones por las que falla un proyecto digital",
    date: 2018-05-29 13:59:44 +0000,
    url: "https://blog.continuum.cl/las-7-razones-por-las-que-falla-un-proyecto-digital-1de23ac573bb?source=rss----d66605ce046d---4",
    category: "ux-research",
    img: "https://cdn-images-1.medium.com/max/1024/1*CE_9F97oNWK0mN3ROT0Nhg.jpeg"
  }
]
```

Receiving this Hash gives you the possibility to build the preview of the posts the way you want, here is an example using an `erb` template:

```html
<div class="blogposts-grid">
  <%- fetch_medium_posts.each do |post| %>
    <div class="blogposts-grid-item">
      <a href="<%= post[:url] %>" target="blank">
        <div class="blogposts-item-image" style="background-image: url('<%= post[:img] %>')"></div>
        <div class="blogposts-item-caption">
          <h3><%= post[:title] %></h3>
          <h6><%= post[:category] %></h6>
        </div>
      </a>
    </div>
  <% end %>
</div>
```
