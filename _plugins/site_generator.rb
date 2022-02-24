require 'date'
require 'xxhash'

module Jekyll

    def Jekyll::get_photo_hash(photo_data)
        XXhash.xxh32(photo_data['file'])
    end

    def Jekyll::get_photo_date(photo_data)
        Date.strptime(photo_data['file'], '%Y%m%d').strftime('%B %-d, %Y')
    end

    class PhotoPage < Page
        def initialize(site, base, dir, photo_data)
            @site = site
            @base = base
            @dir = dir
            @name = "/photo/#{photo_data['id']}/index.md"
            self.process(@name)
            self.data ||= {}
            self.data['layout'] = 'photo'
            self.data['photo'] = photo_data
        end
    end

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

            site.data['photos'].each do |photo_data|
                # add auto-generated metadata to photos
                photo_data['id'] = Jekyll::get_photo_hash(photo_data)
                photo_data['date'] = Jekyll::get_photo_date(photo_data)

                # create photo page
                photo_page = Jekyll::PhotoPage.new(
                    site, site.source, @dir, photo_data
                )
                site.pages << photo_page
            end

            # create "all photos" page
            all_photos_page = Jekyll::CollectionPage.new(
                site, site.source, @dir, 'All photos', '/photos/index.md', site.data['photos']
            )
            site.pages << all_photos_page

        end
    end

end