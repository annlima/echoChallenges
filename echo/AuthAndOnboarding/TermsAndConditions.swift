//
//  TermsAndConditions.swift
//  echo
//
//  Created by Andrea Lima Blanca on 26/02/24.
//

import SwiftUI

struct TermsAndConditions: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Términos y Condiciones")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                Text(termsAndConditionsText)
                    .font(.body)
                    .padding(.bottom, 20)
            }
            .padding()
        }
        .navigationBarTitle(Text("Términos y Condiciones"), displayMode: .inline)
    }
}

private let termsAndConditionsText = """
Bienvenido a echoChallenges. Al acceder y utilizar nuestra red social, usted acepta estar sujeto a los siguientes términos y condiciones. Si no está de acuerdo con alguno de estos términos, no utilice nuestro servicio.

Privacidad
Su privacidad es importante para nosotros. Nuestra Política de Privacidad explica cómo recopilamos, utilizamos y protegemos su información personal. Al utilizar nuestro servicio, acepta que podamos procesar su información de acuerdo con estas políticas.

Uso del Servicio
Usted acuerda utilizar echoChallenges de manera responsable y conforme a la ley. No está permitido publicar contenido violento, discriminatorio, ilegal o que infrinja los derechos de terceros. Nos reservamos el derecho de eliminar contenido que consideremos inapropiado.

Cuentas
Al crear una cuenta en echoChallenges, usted es responsable de mantener la seguridad de su cuenta y de todas las actividades que ocurran bajo el uso de su cuenta. Debe notificarnos inmediatamente sobre cualquier uso no autorizado de su cuenta.

Derechos de Autor
Respetamos los derechos de autor y esperamos que nuestros usuarios hagan lo mismo. Es su responsabilidad asegurarse de que el contenido que comparte no infrinja los derechos de autor de terceros.

Modificaciones a los Términos
Podemos modificar estos términos y condiciones en cualquier momento. Al continuar utilizando nuestro servicio después de que se realicen cambios, usted acepta estar sujeto a los términos modificados.

Contacto
Si tiene preguntas sobre estos términos, por favor contáctenos a través de [Método de Contacto].

Fecha de Vigencia: 26 de Febrero de 2025

© [2024] [echoChallenges]. Todos los derechos reservados.

"""

struct TermsAndConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditions()
    }
}
