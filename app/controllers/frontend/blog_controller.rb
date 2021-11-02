module Frontend
    class BlogController < FrontendController
        def list
            @class = 'blog theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1'
            @page_title = 'Chia Sẻ Kinh Nghiệm &#8211; Điện Nước Trần Chí'
            @service_categories = ServiceCategory.get_categories
        end

        def detail
            @class = 'post-template-default single single-post single-format-standard theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1'
            @page_title = 'Chi Tiết Chia Sẻ Kinh Nghiệm &#8211; Điện Nước Trần Chí'
            @service_categories = ServiceCategory.get_categories
        end
    end
end