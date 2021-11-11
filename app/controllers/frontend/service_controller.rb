module Frontend
    class ServiceController < FrontendController
        def list
            @class = 'page-template page-template-tpl-default-elementor page-template-tpl-default-elementor-php page theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1 elementor-page elementor-page-514'
            @service_categories = ServiceCategory.get_categories

            @service_category = ServiceCategory.find(params[:service_category_id])
            @page_title = @service_category.get_title
            @meta_keywords = @service_category.get_meta_keywords
            @meta_description = @service_category.get_meta_description

            @services = Kaminari.paginate_array(@service_category.get_services_for_service_categories(params)).page(params[:page]).per(1)

            if @service_category.parent_id.present?
                @parent_service_category = @service_category.parent
            else
                @parent_service_category = @service_category
            end
        end

        def detail
            @class = 'page-template page-template-tpl-default-elementor page-template-tpl-default-elementor-php page theme-electman woocommerce-no-js menu-layer elementor-default elementor-kit-1 elementor-page elementor-page-515'
            @service_categories = ServiceCategory.get_categories
            @service = Service.find(params[:service_id])
            @page_title = @service.get_title
            @meta_keywords = @service.get_meta_keywords
            @meta_description = @service.get_meta_description

            if @service.service_category.parent_id.present?
                @parent_service_category = @service.service_category.parent
            else
                @parent_service_category = @service.service_category
            end
        end
    end
end