//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace reseñaModeloPrjct.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Noticias
    {
        public int IdNoticias { get; set; }
        public string titular_noticia { get; set; }
        public System.DateTime fecha_noticia { get; set; }
        public string contenido_noticia { get; set; }
        public int UsuarioId { get; set; }
    
        public virtual Usuario Usuario { get; set; }
    }
}
