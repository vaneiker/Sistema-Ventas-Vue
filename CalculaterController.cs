using CalculadoraPrestamo.Entidades;
using CalculadoraPrestamo.Models;
using System.Collections.Generic;
using System.Web.Http;
using CalculadoraPrestamo.Servicios;
using System;
using Newtonsoft.Json;

namespace CalculadoraPrestamo.Controllers
{
    public class CalculaterController : ApiController
    {


        [HttpGet]
        [Route("api/Calculater/GetTiempo")]
        public IEnumerable<Generico> GetTiempo()
        {
            LoanCalculatorServices cp = new LoanCalculatorServices();
            var entidad = cp.GetDropDown("tiempos", "");
            return entidad;
        }

        [HttpGet]
        [Route("api/Calculater/GetMeses/{Parametro}")]
        public IEnumerable<Generico> GetMeses(string Parametro)
        {
            LoanCalculatorServices cp = new LoanCalculatorServices();
            var entidad = cp.GetDropDown("tiemposRecomendado", Parametro);
            return entidad;
        }


        [HttpPost]
        [Route("api/Calculater/LoanCalculatorSet")]
        public CalculaterViewModel LoanCalculatorSet(Parametros parametros)
        {
            string jsonParameters = "PARAMETERS: " + JsonConvert.SerializeObject(parametros);

            CalculaterViewModel entidad = new CalculaterViewModel();

            LoanCalculatorServices cp = new LoanCalculatorServices();

            var entidadMode = cp.SetCalculator(parametros);
            var AllToJson = JsonConvert.SerializeObject(new object[] { jsonParameters, " RESPONSE: " + JsonConvert.SerializeObject(entidadMode) });
            var resp = cp.LoggValues("SP_SET_ADD_INFORMATION_CALQULATER", AllToJson);



            entidad.Interes = Math.Round((decimal)entidadMode.Interes, 2);
            entidad.BalanceInicial = Math.Round((decimal)entidadMode.BalanceInicial, 2);
            entidad.Principal = Math.Round((decimal)entidadMode.Principal, 2);
            entidad.ValorCuotaMensual = Math.Round((decimal)entidadMode.ValorCuotaMensual, 2);
            entidad.ValorCuotas = Math.Round((decimal)entidadMode.ValorCuotas, 2);
            entidad.MontoCuotaSeguros = Math.Round((decimal)entidadMode.MontoCuotaSeguros, 2);
            entidad.MontoPrestar = Math.Round((decimal)entidadMode.MontoPrestar, 2);
            entidad.Mensaje = entidadMode.Mensaje;
            entidad.NivelMensaje = entidadMode.NivelMensaje.Trim().TrimEnd().TrimStart();

            return entidad;
        }
    }
}
