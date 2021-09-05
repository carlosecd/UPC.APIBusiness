using DBEntity;
using UPC.APIBusiness.DBEntity.Model;

namespace UPC.APIBusiness.DBContext.Interface
{
    public interface IPersonaRepository
    {
        ResponseBase Insert(EntityPersonaBasic persona);
        ResponseBase Update(EntityPersonaUpdate persona);
        ResponseBase FindById(int idPersona);
    }
}
