import './App.css';
import CreateUser from './components/user/CreateUser';
import UsersList from './components/user/UsersList';

function App() {
  return (
    <>
      <h1>User Account</h1>
      <CreateUser />
      <br />
      <UsersList />
    </>
  );
}

export default App;
