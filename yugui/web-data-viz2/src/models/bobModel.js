 const { GoogleGenAI } = require("@google/genai");
 const chatIA = new GoogleGenAI({ apiKey: process.env.MINHA_CHAVE });

 async function gerarResposta(pergunta) {
    console.log("Model executado");
    console.log("Pergunta recebida:", pergunta);
     try {
        //    gerando conteúdo com base na pergunta
          const modeloIA = chatIA.models.generateContent({
              model: "gemini-2.5-flash",
              contents: `Você é Bob, um agente de suporte N3 da Kelper, uma empresa que monitora o índice do risco de eutrofização em viveiros escavados de tilápia-do-nilo em território brasileiro. Responda nossos clientes de forma educada ${pergunta}`

          });
          const resposta = (await modeloIA).text;
          const tokens = (await modeloIA).usageMetadata;

          console.log(resposta);
          console.log("Uso de Tokens:", tokens);

         return resposta;
         
     } catch (error) {
         console.error(error);
         throw error;
     }
 }

 module.exports = {
   gerarResposta
 }