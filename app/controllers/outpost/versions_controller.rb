class Outpost::VersionsController < Outpost::BaseController
  include Outpost::Controller::Ordering

  self.model = Secretary::Version

  define_list do |l|
    l.default_order_attribute   = "created_at"
    l.default_order_direction   = Outpost::DESCENDING
    l.per_page                  = 10

    l.column :user, display: ->(r) { r.user.try(:to_title) || "System" }
    l.column :description
    l.column :versioned,
      :header     => "Object",
      :display    => ->(r) { r.versioned.simple_title }

    l.column :version_number, header: "Version"
    l.column :created_at, header: "Timestamp"
  end


  before_filter :set_order_and_direction, only: [:index, :show, :activity]
  before_filter :get_object, only: [:index, :show]
  before_filter :authorize_resource, only: [:index, :show]
  before_filter :extend_breadcrumbs_for_object, only: [:index, :show]


  #--------------
  # See all activity
  def activity
    breadcrumb "Activity"

    @versions = Secretary::Version.order(order)
      .page(params[:page]).per(list.per_page)

    render :index
  end


  #--------------
  # See activity for a single object
  def index
    breadcrumb "History"

    @versions = @object.versions.order(order)
      .page(params[:page]).per(list.per_page)
  end


  #--------------
  # Compare a version to its previous version
  def show
    @version = @object.versions.find_by_version_number!(params[:version_number])

    breadcrumb "History",
      secretary.history_path(@object.class.route_key, @object.id),
      @version.to_title
  end


  private

  # Override this from Outpost to get around kaminari bug:
  # https://github.com/amatsuda/kaminari/issues/457
  def route_proxy
    secretary
  end


  def set_order_and_direction
    @order_attribute  = "created_at"
    @order_direction  = Outpost::DESCENDING
  end


  def get_object
    klass = Outpost::Helpers::Naming.to_class(params[:resources])
    redirect_to outpost.root_path if !klass.has_secretary?
    @object = klass.find(params[:resource_id])
  end


  def authorize_resource
    authorize(@object.class)
  end


  def extend_breadcrumbs_for_object
    breadcrumb @object.class.name.titleize.pluralize,
      @object.class.admin_index_path

    breadcrumb @object.simple_title, @object.admin_edit_path
  end
end
