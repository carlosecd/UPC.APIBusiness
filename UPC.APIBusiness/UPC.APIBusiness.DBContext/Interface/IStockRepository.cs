using DBEntity;
namespace DBContext
{
    public interface IStockRepository
    {
        ResponseBase GetStock();
        ResponseBase GetStock(EntityStockByCategory stockByCategory);
        ResponseBase GetStock(EntityStockByProduct stockByProduct);

        ResponseBase GetCategoryBanner();
        ResponseBase GetProductoBanner();
    }
}
