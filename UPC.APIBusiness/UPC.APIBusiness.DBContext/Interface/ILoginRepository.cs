using DBEntity;


namespace DBContext
{
    public interface ILoginRepository
    {
        ResponseBase GetLogin(EntityLogin login);

    }
}
    