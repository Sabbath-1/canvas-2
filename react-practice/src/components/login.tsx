import GhLogo from '../assets/Ghana Crest.svg'

function Login () {
    return (
       <div className="flex flex-col items-center justify-center bg-white p-8 rounded-lg shadow-md shadow-black/10 max-w-[400px] w-full mx-auto">
            <div className="w-full mb-2 text-center"><img className="h-auto w-20" src={GhLogo} alt="Ghana Crest" /></div>
            <h1 className="text-center mb-2 text-2xl font-semibold text-gray-900">Official Welfare Portal</h1>
            <p className="mb-6 text-center text-gray-700">Log in to access your dashboard</p>

            <form id="loginForm">
            <div>
                <label htmlFor="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="yourmail@example.com" required />
            </div>

            <div>
                <label htmlFor="password">Password</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required />
            </div>

            <div className="remember-me">
                <label><input type="checkbox" /> Remember me</label>
                <a href="#">Forgot password?</a>
            </div>

            <button type="submit" className="btn">Login</button>
            </form>

            <footer className="footer">
            Don’t have an account? <a href="#">Contact admin</a>
            </footer>
        </div>

    )
}

export default Login 