module Frontend
    class InformationController < FrontendController
        def about
            @class = 'page-template page-template-tpl-default-elementor page-template-tpl-default-elementor-php page theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1 elementor-page elementor-page-649'
            @page_title = 'Giới Thiệu &#8211; Điện Nước Trần Chí'
            @service_categories = ServiceCategory.get_categories
        end

        def contact
            @class = 'page-template page-template-tpl-default-elementor page-template-tpl-default-elementor-php page theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1 elementor-page elementor-page-574'
            @page_title = 'Liên Hệ &#8211; Điện Nước Trần Chí'
            @service_categories = ServiceCategory.get_categories
        end

        def diary
            @class = 'page-template page-template-tpl-default-elementor page-template-tpl-default-elementor-php page theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1 elementor-page elementor-page-1822'
            @page_title = 'Nhật Ký Công Việc &#8211; Điện Nước Trần Chí'
            @service_categories = ServiceCategory.get_categories

            @diaries = Diary.get_active
        end

        def faq
            @class = 'page-template page-template-tpl-default-elementor page-template-tpl-default-elementor-php page theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1 elementor-page elementor-page-399'
            @page_title = 'Câu Hỏi Thường Gặp &#8211; Điện Nước Trần Chí'
            @service_categories = ServiceCategory.get_categories

            @faqs = Faq.get_active
        end
    end
end