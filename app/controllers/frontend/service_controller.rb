module Frontend
    class ServiceController < FrontendController
        def list
            @class = 'page-template page-template-tpl-default-elementor page-template-tpl-default-elementor-php page theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1 elementor-page elementor-page-514'
            @page_title = 'Dịch Vụ Điện Nước Tại Biên Hòa &#8211; Điện Nước Trần Chí'
            @service_categories = ServiceCategory.get_categories

            @service_category = ServiceCategory.find(params[:service_category_id])
            @services = Kaminari.paginate_array(@service_category.get_services_for_service_categories(params)).page(params[:page]).per(1)

            if @service_category.parent_id.present?
                @parent_service_category = @service_category.parent
            else
                @parent_service_category = @service_category
            end
        end

        def detail
            @class = 'page-template page-template-tpl-default-elementor page-template-tpl-default-elementor-php page theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1 elementor-page elementor-page-515'
            @page_title = 'Sửa Chữa Điện Tận Nhà, Uy Tín, Giá Rẻ &#8211; Điện Nước Trần Chí'
            @service_categories = ServiceCategory.get_categories
        end
    end
end