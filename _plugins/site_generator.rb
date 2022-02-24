module Jekyll

    class CollectionPage < Page
        def initialize(site, base, dir, title, url, photo_arr)
            @site = site
            @base = base
            @dir = dir
            @name = url
            self.process(@name)
            self.data ||= {}
            self.data['layout'] = 'collection'
            self.data['title'] = title
            self.data['photos'] = photo_arr
        end
    end

    class SiteGenerator < Generator
        def generate(site)

            # create "all photos" page
            all_photos_page = Jekyll::CollectionPage.new(
                site, site.source, @dir, 'All photos', '/photos/index.md', site.data['photos']
            )
            site.pages << all_photos_page

        end
    end

end