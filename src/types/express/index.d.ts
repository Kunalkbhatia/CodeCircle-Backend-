
import { UserResponseType } from "../resTypes.ts";
export {}

declare global {
  namespace Express {
    export interface Request {
      user?: Partial<UserResponseType>;
    }
  }
}