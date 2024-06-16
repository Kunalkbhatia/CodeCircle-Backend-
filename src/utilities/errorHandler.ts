class ErrorHandler extends Error{
    constructor(public message: string, public statusCode: number, public code?: string){
        super(message)
        this.statusCode = statusCode
        this.code = code
    }
}

export default ErrorHandler