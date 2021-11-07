module Frontend
    class HomeController < FrontendController
        def index
            @class = 'page-template page-template-tpl-default-elementor page-template-tpl-default-elementor-php page theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1 elementor-page elementor-page-9'
            @page_title = 'Điện Nước Trần Chí &#8211; Thợ Sửa Chữa Điện Nước, Máy Lọc Nước Biên Hòa'
            @service_categories = ServiceCategory.get_categories
            @diaries = Diary.get_active.limit(6)
        end
    end
end