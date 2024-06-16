export interface UserResponseType {
  id: string;
  firstName: string;
  lastName: string | null;
  email: string;
  password: string;
  age: number;
  collage: string;
  graduationYear: number;
  title: string | null;
  bio: string | null;
  company: string | null;
  experience: number;
  techStack: string | null;
  createdAt: Date;
  socialHandles: socialHandlesResponseType | null;
}

export interface socialHandlesResponseType {
  id: string;
  userId: string;
  twitter: string | null;
  instagram: string | null;
  linkedIn: string | null;
  github: string | null;
  portfolio: string | null;
  other: string | null;
}

export interface GeneralPostResponseType {
  id: string;
  userId: string;
  description: string;
  likes: number;
  comments: commentResponse[];
}
export interface QueryPostResponseType {
  id: string;
  userId: string;
  title: string;
  description: string;
  likes: number;
  solved: boolean;
  comments: commentResponse[];
}

export interface commentResponse {
  id: string;
  userId: string;
  generalPostId: string | null;
  queryPostId: string | null;
  likes: number;
}
