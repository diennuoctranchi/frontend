module Frontend
    class BlogController < FrontendController
        def list
            @class = 'blog theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1'
            @page_title = 'Chia Sẻ Kinh Nghiệm &#8211; Điện Nước Trần Chí'
            @service_categories = ServiceCategory.get_categories

            @blogs = Kaminari.paginate_array(Blog.get_active).page(params[:page]).per(1)

            @electrician_category = ServiceCategory.find(1)
            @water_purifier_repairman_category = ServiceCategory.find(10)
            @refrigeration_electrician_category = ServiceCategory.find(9)
            @home_repairman = ServiceCategory.find(17)
        end

        def detail
            @class = 'post-template-default single single-post single-format-standard theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1'
            @page_title = 'Chi Tiết Chia Sẻ Kinh Nghiệm &#8211; Điện Nước Trần Chí'
            @service_categories = ServiceCategory.get_categories

            @blog = Blog.find(params[:blog_id])
        end
    end
end