import Image from 'next/image'
import styles from './page.module.css'
import LoginButtom from '../components/login-btn'
import Head from 'next/head';
import Link from 'next/link';
import { signIn, signOut, useSession } from 'next-auth/react';
import { auth } from "../../auth";
import { useEffect } from 'react';

//import { MouseEventHandler } from 'react';

type MouseEventHandler<T extends HTMLElement> = Event & {
  target: T;
}

export default async function Home() {
  const session = await auth()

  function handleLogin(event: MouseEventHandler<HTMLAnchorElement>) {
    event.preventDefault();
    signIn();
  }
 
  const handleLogout = (event: MouseEventHandler<HTMLAnchorElement>) => {
    event.preventDefault();
    signOut();
  };

  const handleClick = (event: any) => {
    event.preventDefault();
    signOut();
  };

  return (
    <main className={styles.main}>

    <div className={styles.container}>
      <Head>
        <title>Create Next App</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <h1>Home</h1>
      <p>
        NextJS + Keycloak + docker-compose
      </p>
        
        <ul>
            <li> <Link href="/login">/login</Link></li>
            <li> <Link href="/api/auth/signin">/api/auth/signin</Link></li>
            <li> <Link href="/api/auth/signout">/api/auth/signout</Link></li>
        </ul>
 
        <h1>Session</h1>
        <pre>session: {JSON.stringify(session, null, 2)}</pre>

        <h1>Protected</h1>
        <Link href="/protected">Protected &rarr;</Link>
    </div>
    </main>
  )
}
