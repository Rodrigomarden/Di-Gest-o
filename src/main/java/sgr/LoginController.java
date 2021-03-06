package sgr;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")

public class LoginController extends HttpServlet {

	private String valor(HttpServletRequest req, String param, String padrao) {
		String result = req.getParameter(param);
		if (result == null) {
			result = padrao;
		}
		return result;
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String msg = "";
			String op = valor(req, "operacao", "");
			String usuario = valor(req, "usuario", "");
			String senha = valor(req, "senha", "");
			String tipo = "";
			if (op.equals("entrar")) {
				boolean resposta = LoginDao.comparar(usuario, senha);
				tipo = LoginDao.tipo(usuario, senha);
				if (resposta == true) {

					//Obter a sessão.
					HttpSession session = req.getSession();
					//Incluir variável na região de memória da sessão.
					session.setAttribute("usuario", usuario);
					if(tipo.equals("Garçom")) {
						resp.sendRedirect("garcom_mesas");
					} else if(tipo.equals("Gerente")) {
						resp.sendRedirect("gerente_mesas");
					} else if(tipo.equals("Administrador")) {
						resp.sendRedirect("gerenciar_funcionario");
					} else if(tipo.equals("Cozinha")) {
						resp.sendRedirect("cozinha_pedidos");
					}
				} else {
					msg = "Usuário ou senha incorreta.";
				}
			} else if (op.equals("")) {
				msg = "";
			} else {
				throw new IllegalArgumentException("Operação \"" + op + "\" não suportada.");
			}
			req.setAttribute("msg", msg);
			req.getRequestDispatcher("LoginView.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace(resp.getWriter());
		}
	}
}