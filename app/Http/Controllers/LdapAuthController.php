<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class LdapAuthController extends Controller
{
    public function login(Request $request)
    {
        try {
            // Validar la entrada del formulario
            $request->validate([
                'user' => 'required',
                'password' => 'required',
            ]);

            // Captcha (si es necesario, puedes integrar la validación aquí)
            // $captcha = $request->input('g-recaptcha-response');
            // $response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=" . env('CAPTCHA_SECRET_KEY') . "&response=" . $captcha);
            // $responseKeys = json_decode($response, true);
            // if (intval($responseKeys["success"]) !== 1) {
            //     return redirect()->back()->with('error', 'Captcha inválido');
            // }

            // Buscar usuario en la base de datos local
            $userRow = DB::table('users')->where('email', $request->input('user'))->first();

            if (!$userRow) {
                return response()->json([
                    'success' => false,
                    'message' => 'Usuario no encontrado. #32'
                ], 400);
            }

            // Datos para la autenticación en LDAP
            $userName = $userRow->name;
            $password = $request->input('password');
            $ldapHost = env('LDAP_HOST');
            $ldapPort = env('LDAP_PORT');
            $ldapBindDn = env('LDAP_BIND_DN');
            $ldapPassword = env('LDAP_PASSWORD');
            $ldapBaseDn = env('LDAP_BASE_DN');
            $Sistema    = env('APP_NAME');
            $TestUser   = env("LDAP_TEST_USER");
            $Landing    = env("LDAP_LANDING");


            ///CODIGO PARA USUARIO DE DESARROLLO SE DEFINE EN .env
            if ($TestUser && $TestUser === $request->input('user')) {                                     
                Auth::loginUsingId($userRow->id);
                return response()->json([
                    'success' => true,
                    'message' => 'Autenticación exitosa.',
                    'url'     => $Landing
                ], 200);
            }

            // Conexión al servidor LDAP
            $ldapCon = ldap_connect($ldapHost, $ldapPort);
            ldap_set_option($ldapCon, LDAP_OPT_PROTOCOL_VERSION, 3);
            ldap_set_option($ldapCon, LDAP_OPT_REFERRALS, false);

            if (ldap_bind($ldapCon, $ldapBindDn, $ldapPassword)) {
                // Búsqueda del usuario en el directorio LDAP
                $filter = "(SAMAccountName=" . $userName . ")";
                $search = ldap_search($ldapCon, $ldapBaseDn, $filter, ['cn', 'givenName', 'sn', 'samaccountname']);
                $entries = ldap_get_entries($ldapCon, $search);

                if ($entries['count'] > 0) {
                    $dnUser = $entries[0]["dn"];

                    // Intento de autenticar al usuario con su contraseña ingresada
                    if (ldap_bind($ldapCon, $dnUser, $password)) {
                        // Si la autenticación es exitosa, se crea la sesión
                        Auth::loginUsingId($userRow->id);

                        // Guardar datos del usuario en sesión
                        //'utnfrro_'.Sistema.'_user_login_session'
                        //session([
                        //    "utnfrro_".$Sistema."_user_login_session" => true,
                        //    "utnfrro_".$Sistema."_idUsuario" => $userRow->id,
                        //    "utnfrro_".$Sistema."_USERNAME" => $userRow->userName,
                        //    "utnfrro_".$Sistema."_nombre" => $userRow->nombre,
                        //    "utnfrro_".$Sistema."_apellido" => $userRow->apellido,
                        //    "utnfrro_".$Sistema."_nivelPermisos" => $userRow->nivelPermiso,
                        //]);
                        //Nivel Permisos
                        //0 = Vista
                        //1 = Escritura
                        //2 = SuperAdmin

                        return response()->json([
                            'success' => true,
                            'message' => 'Autenticación exitosa.',
                            'url'     => $Landing
                        ], 200);
                    } else {
                        return response()->json([
                            'success' => false,
                            'message' => 'Contraseña incorrecta.'
                        ], 400);
                    }
                } else {
                    return response()->json([
                        'success' => false,
                        'message' => 'Usuario no encontrado en LDAP.'
                    ], 400);
                }
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Error de conexión con LDAP.'
                ], 400);
            }
        } catch (\Exception $e) {
            // Manejar la excepción y devolver un mensaje limpio
            return response()->json([
                'success' => false,
                'message' => 'Ocurrió un error al procesar la solicitud #100',
                'error' => $e->getMessage(), // Esto incluye el mensaje detallado del error
            ], 400);
        }
    }
}
