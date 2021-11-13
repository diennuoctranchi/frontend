module Frontend
    class BlogController < FrontendController
        def list
            @class = 'blog theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1'
            @page_title = 'Chia Sẻ Kinh Nghiệm &#8211; Điện Nước Trần Chí'
            @meta_description = 'Chia Sẻ Kinh Nghiệm &#8211; Điện Nước Trần Chí tự hào là đơn vị chuyên cung cấp các dịch vụ lắp đặt, bảo trì và sửa chữa điện nước tại khu vực TP. Biên Hòa thuộc tỉnh Đồng Nai.'
            @service_categories = ServiceCategory.get_categories

            @blogs = Kaminari.paginate_array(Blog.get_active).page(params[:page]).per(1)
        end

        def detail
            @class = 'post-template-default single single-post single-format-standard theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1'
            @service_categories = ServiceCategory.get_categories
            @blog = Blog.find(params[:blog_id])
            @page_title = @blog.get_title
            @meta_description = @blog.meta_description
        end
    end
end